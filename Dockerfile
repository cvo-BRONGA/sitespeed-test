# ---- Base Node ----
ARG BASE_IMAGE_ACR=gacr2pbaseimages
ARG ACR_REPO="gap/hub/caas/baseimage-alpine-nodejs"
ARG BASE_IMAGE_VERSION="0.0.11"
FROM ${BASE_IMAGE_ACR}.azurecr.io/${ACR_REPO}:${BASE_IMAGE_VERSION}