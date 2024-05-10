set -e
export IMAGE_NAME="site"
export IMAGE_VERSION="6"
docker build --rm --tag $IMAGE_NAME:$IMAGE_VERSION .
envsubst '\$IMAGE_VERSION' < 'site_template.hcl' > 'site.hcl'
nomad job run site.hcl
rm site.hcl