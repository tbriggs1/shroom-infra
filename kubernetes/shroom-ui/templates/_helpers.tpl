{{/* 
Unique name of the shroom UI Chart
*/}}
{{- define "shroomui.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

