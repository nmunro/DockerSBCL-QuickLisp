FROM fedora

RUN dnf update -y
RUN dnf install -y sbcl wget
RUN cd /tmp && \
    wget https://beta.quicklisp.org/quicklisp.lisp && \
    sbcl --load quicklisp.lisp --quit --eval '(quicklisp-quickstart:install)'
COPY sbclrc /root/.sbclrc
RUN ["sbcl", "--non-interactive", "--eval", "\"(ql:quickload :cl-project)\""]
