{{/*
  Custom helper to allow overriding args for wait-for-airflow-migrations initContainer in api-server.
  Usage: {{ include "waitForMigrationsArgs" . }}
*/}}
{{- define "waitForMigrationsArgs" -}}
  {{- if .Values.apiServer.waitForMigrations.args }}
    {{- tpl (toYaml .Values.apiServer.waitForMigrations.args) . | nindent 10 }}
  {{- else }}
    {{- include "wait-for-migrations-command" . | indent 10 }}
  {{- end }}
{{- end -}}
