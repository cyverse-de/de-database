INSERT INTO webhooks_type (type, template)
        VALUES('Zapier', '
{
  "id": "{{.ID}}",
  "name": "{{.Name}}"
  "text": "{{.Msg}}. {{if .Completed}} <{{.Link}}|{{.LinkText}}> {{- end}}"
}
');
