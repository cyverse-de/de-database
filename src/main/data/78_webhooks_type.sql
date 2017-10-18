INSERT INTO webhooks_type (type, template)
        VALUES('Slack','
{
	"text": "{{.Msg}}. {{if .Completed}} <{{.Link}}|{{.LinkText}}> {{- end}}"
}
');
