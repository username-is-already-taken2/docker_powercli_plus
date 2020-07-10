FROM mcr.microsoft.com/powershell:ubuntu-bionic

LABEL authors="DigitalGaz@hotmail.com"

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get update -y -q && apt-get install -y unzip && apt-get clean

# Set working directory so stuff doesn't end up in /
WORKDIR /root

# Install VMware modules from PSGallery
SHELL [ "pwsh", "-command" ]
RUN Set-PSRepository -Name PSGallery -InstallationPolicy Trusted
RUN Install-Module VMware.PowerCLI,PowerNSX,AWSPowerShell.Netcore

CMD ["/usr/bin/pwsh"]
