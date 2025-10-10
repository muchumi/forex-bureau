FROM mcr.microsoft.com/businesscentral/sandbox:w1-ltsc2022

# Copy your Forex-Bureau app
COPY ./Forex-Bureau.app /app/Forex-Bureau.app

# Publish and install the app automatically
SHELL ["powershell", "-Command"]
RUN Publish-BCContainerApp -appFile 'C:\\app\\Forex-Bureau.app' -skipVerification -install
