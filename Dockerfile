FROM matrixdotorg/synapse:v1.49.0

# Copy the pegacorn python source code over the synapse source code
# This method only works if the changes made to the source code don't introduce new dependencies, 
# that the synapse docker image doesn't already provide.
COPY synapse/config/server.py /usr/local/lib/python3.8/site-packages/synapse/config/server.py
COPY synapse/handlers/room.py /usr/local/lib/python3.8/site-packages/synapse/handlers/room.py

# Install our root certificates
COPY docker/ca-local.cer /usr/local/share/ca-certificates/ca-local.crt
COPY docker/ca-root-org.cer /usr/local/share/ca-certificates/ca-root-org.crt
RUN update-ca-certificates

# Date-time build argument
ARG IMAGE_BUILD_TIMESTAMP
ENV IMAGE_BUILD_TIMESTAMP=${IMAGE_BUILD_TIMESTAMP}
RUN echo IMAGE_BUILD_TIMESTAMP=${IMAGE_BUILD_TIMESTAMP}
