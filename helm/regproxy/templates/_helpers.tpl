{{/*
Define a named template to get the CACHE_MAX_SIZE value and convert it to Gi
*/}}
{{- define "sizeLimit" -}}
{{- $cacheMaxSize := dict "name" "CACHE_MAX_SIZE" "value" "0" }}
{{- range .Values.regproxy.env }}
  {{- if eq .name $cacheMaxSize.name }}
    {{- $cacheMaxSize = . }}
  {{- end }}
{{- end }}
{{- $numericValue := printf "%s" $cacheMaxSize.value | regexFind "\\d+" }}
{{- printf "%sGi" $numericValue | quote }}
{{- end }}
