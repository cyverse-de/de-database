-- Container settings for the synthetic tools (resource limits, network, working
-- dir). The interactive tool also gets proxy settings and a published port; one
-- tool gets a device and a volume mount. These feed the tool details and app job
-- view responses.
BEGIN;
SET search_path = public, pg_catalog;

INSERT INTO interactive_apps_proxy_settings (id, image, name, frontend_url, cas_url, cas_validate) VALUES
    ('d0000000-0000-0000-0000-0000000000a1', 'test/vice-proxy:latest', 'vice-proxy',
        'https://vice.test.example.org', 'https://cas.test.example.org', 'https://cas.test.example.org/validate')
ON CONFLICT (id) DO NOTHING;

INSERT INTO container_settings
    (id, tools_id, cpu_shares, memory_limit, min_memory_limit, min_cpu_cores, max_cpu_cores, min_disk_space, network_mode, working_directory, name, interactive_apps_proxy_settings_id) VALUES
    ('c5000000-0000-0000-0000-000000000001', '44444444-4444-4444-4444-444444444401', 1024, 2147483648, 1073741824, 1, 4, 1073741824, 'bridge', '/work', 'test-tool-1', NULL),
    ('c5000000-0000-0000-0000-000000000002', '44444444-4444-4444-4444-444444444402', 1024, 4294967296, 2147483648, 1, 8, 2147483648, 'bridge', '/work', 'test-tool-2', NULL),
    ('c5000000-0000-0000-0000-000000000003', '44444444-4444-4444-4444-444444444403', 512,  1073741824, 536870912,  1, 2, 536870912,  'bridge', '/work', 'test-tool-3', NULL),
    ('c5000000-0000-0000-0000-000000000004', '44444444-4444-4444-4444-444444444404', 512,  1073741824, 536870912,  1, 2, 536870912,  'none',   '/work', 'test-tool-4', NULL),
    ('c5000000-0000-0000-0000-000000000005', '44444444-4444-4444-4444-444444444405', 2048, 8589934592, 4294967296, 2, 8, 4294967296, 'bridge', '/work', 'test-interactive-tool', 'd0000000-0000-0000-0000-0000000000a1'),
    ('c5000000-0000-0000-0000-000000000006', '44444444-4444-4444-4444-444444444406', 1024, 2147483648, 1073741824, 1, 4, 1073741824, 'bridge', '/work', 'test-osg-tool', NULL)
ON CONFLICT (id) DO NOTHING;

INSERT INTO container_devices (id, container_settings_id, host_path, container_path) VALUES
    ('c5d00000-0000-0000-0000-000000000001', 'c5000000-0000-0000-0000-000000000001', '/dev/fuse', '/dev/fuse')
ON CONFLICT (id) DO NOTHING;

INSERT INTO container_volumes (id, container_settings_id, host_path, container_path) VALUES
    ('c5b00000-0000-0000-0000-000000000001', 'c5000000-0000-0000-0000-000000000001', '/tmp/test-host', '/data')
ON CONFLICT (id) DO NOTHING;

INSERT INTO container_ports (id, container_settings_id, host_port, container_port, bind_to_host) VALUES
    ('c5c00000-0000-0000-0000-000000000005', 'c5000000-0000-0000-0000-000000000005', NULL, 8080, false)
ON CONFLICT (id) DO NOTHING;

COMMIT;
