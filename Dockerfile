# 🏗
FROM swift:5.1 as builder

LABEL maintainer="Moritz Lang <hi@slashmo.codes>"

ENV DEBIAN_FRONTEND noninteractive
ENV CONFIGURATION release
ENV BIN_DIR /opt/swiftpm/bin

WORKDIR /src

COPY Sources Sources
COPY Package.swift .
COPY Package.resolved .

# Dependencies
RUN swift package resolve

# Production build
RUN mkdir -p ${BIN_DIR}
RUN swift build -c ${CONFIGURATION}
RUN cp $(swift build -c release --show-bin-path)/Run ${BIN_DIR}/

# 🚀
FROM swift:5.0.3-slim

WORKDIR /

COPY --from=builder /usr/lib/swift/linux/*.so* /usr/lib/swift/linux/
COPY --from=builder /opt/swiftpm/bin/Run /opt/swiftpm/bin/Run

WORKDIR /opt/swiftpm

CMD ./bin/Run
