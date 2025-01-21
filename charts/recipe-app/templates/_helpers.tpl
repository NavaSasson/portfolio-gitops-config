# charts/recipe-app/templates/_helpers.tpl
{{/*
Expand the name of the chart.
*/}}
{{- define "recipe-app.name" -}}
{{- .Chart.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "recipe-app.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "recipe-app.labels" -}}
helm.sh/chart: {{ include "recipe-app.chart" . }}
{{ include "recipe-app.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "recipe-app.selectorLabels" -}}
app.kubernetes.io/name: {{ include "recipe-app.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}