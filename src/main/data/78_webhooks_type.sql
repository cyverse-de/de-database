INSERT INTO webhooks_type (type, template)
        VALUES('Slack','
{
	"text": "{{.Msg}}. {{if .Completed}} <{{.Link}}|{{.LinkText}}> {{- end}}"
}
');
INSERT INTO webhooks_type (type, template)
        VALUES('Zapier', '
{
  "id": "{{.ID}}",
  "name": "{{.Name}}",
  "text": "{{.Msg}}. {{if .Completed}} <{{.Link}}|{{.LinkText}}> {{- end}}"
}
');
