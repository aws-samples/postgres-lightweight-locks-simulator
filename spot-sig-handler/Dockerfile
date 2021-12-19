FROM arm64v8/alpine:3.14
RUN apk add --no-cache curl ca-certificates
RUN curl -f -s -o /usr/local/bin/kubectl https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/arm64/kubectl && \
    chmod +x /usr/local/bin/kubectl && \
    kubectl version --client
RUN apk add --no-cache python3 py3-pip
RUN pip install awscli
COPY start.sh /
RUN chmod +x /start.sh
