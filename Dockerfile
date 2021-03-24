FROM matrixdotorg/synapse:v1.26.0

# Copy the pegacorn python source code over the synapse source code
# This method only works if the changes made to the source code don't introduce new dependencies, 
# that the synapse docker image doesn't already provide.
COPY ./synapse/config/server.py /usr/local/lib/python3.8/site-packages/synapse/config/server.py
COPY ./synapse/handlers/room.py /usr/local/lib/python3.8/site-packages/synapse/handlers/room.py
COPY ./synapse/rest/well_known.py /usr/local/lib/python3.8/site-packages/synapse/rest/well_known.py