FROM julia:1.4.2
# FROM ubuntu:18.04
LABEL maintainer="Yusri"

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    apt-utils gcc g++ cmake build-essential \
    && apt-get clean


WORKDIR /mvapp
COPY ./ ./

# CMD ["echo", "hello"]
RUN julia  --project create_sysimage.jl -O3
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* ./data/0429
# CMD ["julia" "--project" "--startup-file=no" "--color=yes" "-e"]
CMD ["./MVApp.sh"]



