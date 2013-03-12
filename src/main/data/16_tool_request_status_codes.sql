-- Populates the tool_request_status_codes table.

INSERT INTO tool_request_status_codes ( name, description ) VALUES
    ( 'Submitted', 'The request has been submitted, but not acted upon by the support team.' ),
    ( 'Pending', 'The support team is waiting for a response from the requesting user.' ),
    ( 'Evaluation', 'The support team is evaluating the tool for installation.' ),
    ( 'Installation', 'The support team is installing the tool.' ),
    ( 'Validation', 'The support team is verifying that the installation was successful.' ),
    ( 'Completion', 'The tool has been installed successfully.' ),
    ( 'Failed', 'The tool could not be installed.' );
