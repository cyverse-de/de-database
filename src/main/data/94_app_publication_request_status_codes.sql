-- Populates the app_publication_request_status_codes table.

INSERT INTO app_publication_request_status_codes ( id, name, description, email_template ) VALUES
    ( '1FB4295B-684E-4657-AFAB-6CC0912312B1',
      'Submitted',
      'The request has been submitted, but not acted upon by the support team.',
      NULL ),
    ( '046C9445-9070-4CCD-A2E9-66EE23124CE8',
      'Completion',
      'The app has been made available for public use.',
      'app_publication_completion' );
