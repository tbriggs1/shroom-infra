{{/* 
Unique name of the shroom UI Chart
*/}}
{{- define "shroomui.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/* 
Selector labels
*/}}
# {{- define "shroomui.selectorLabels" -}}
# app.kubernetes.io/name: {{ include shroomui.name .}}
# app.kubernetes.io/instance: {{ .Release.Name }}
# {{- end }}