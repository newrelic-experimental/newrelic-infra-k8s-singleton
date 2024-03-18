{{- if empty .Values.cluster }}
  # Print error message
  {{- fail "cluster is required!" }}  
{{- end }}

{{- required "cluster is required!" .Values.cluster }}