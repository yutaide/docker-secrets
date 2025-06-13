FROM ubuntu:22.04 AS builder
RUN \
  --mount=type=secret,id=CTI_PRODUCT_JWT_SECRET \
  mkdir -p /cti/secrets; \
  cp /run/secrets/CTI_PRODUCT_JWT_SECRET /cti/secrets/CTI_PRODUCT_JWT_SECRET

CMD ["tail", "-f", "/dev/null"]
