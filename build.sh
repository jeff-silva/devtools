reset
rm -rf ./docs
docker compose run --rm nuxt3 yarn generate
cp -r ./nuxt3/.output/public ./docs
git add .
git commit -m "build"
git push