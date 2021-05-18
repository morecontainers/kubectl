FROM alpine:latest
ARG release=v1.21.1
RUN wget -O /usr/local/bin/kubectl https://storage.googleapis.com/kubernetes-release/release/$release/bin/linux/amd64/kubectl
RUN chmod +x /usr/local/bin/kubectl
RUN mkdir /.kube

FROM scratch
COPY --from=0 /usr/local/bin/kubectl /.kube /
ENTRYPOINT ["/kubectl"]
