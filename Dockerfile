# Start with a stock Ubuntu 24.04 image
FROM ubuntu:24.04

# Install basic packages
RUN apt update && apt install -y build-essential rustup python3-pip

# For Rust: install a recent Rust compiler
# RUN install -D /usr/bin/rustup /root/.cargo/bin/rustup && /root/.cargo/bin/rustup install 1.89.0

# Do not edit anything above this line.  If you need to install more
# Ubuntu or python packages, uncomment and edit lines like the
# following:

RUN apt update && apt install -y libsodium-dev
# "--break-system-packages" allows installation outside of a venv, which
# is fine in a docker
RUN pip3 install --break-system-packages pysodium

# You shouldn't have to edit anything below this line, either.

# Copy your code directory into the image under /root
COPY code /root/code/

# Make /root/code the default working directory
WORKDIR /root/code

# For Rust: build the binary with cargo, and copy it into /root/code
# RUN cargo build
# RUN cp target/debug/a4 .

# For C++: build the binary with make, which should create the binary a4
# in the current directory
# RUN make

# For Python: just make the a4 python script executable, in case it
# wasn't marked as such in the git repo
RUN chmod 755 dfa-stream-en-decoder