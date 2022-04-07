FROM migrate/migrate:4 AS migrate

FROM postgres:12

COPY migrations /migrations

COPY --from=migrate /usr/local/bin/migrate /usr/local/bin/migrate

VOLUME /migrations

ENTRYPOINT ["migrate"]
CMD ["--help"]
