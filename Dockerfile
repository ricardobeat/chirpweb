FROM node:12.18-alpine
ENV NODE_ENV=production
COPY . /build
WORKDIR /build
COPY ["package.json", "package-lock.json*", "npm-shrinkwrap.json*", "./"]
RUN npm install --production --silent && mv node_modules ../
COPY . /build
RUN npm install --global coffeescript &&  coffee --compile --output assets/ src/

FROM nginx:alpine
# copy the compiled coffeescript code to the final container
#  --from=0  tells docker that you want to copy files from the perviose container image
COPY --from=0 /build /usr/share/nginx/html
RUN echo "nginx:alpine started."
EXPOSE 80
CMD ["nginx","-g","daemon off;"]

