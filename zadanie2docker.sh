setfacl -m u:testuser:rw /var/run/docker.sock
cat <<'EOT' > /etc/polkit-1/rules.d/00-docker-restart.rules
polkit.addRule(function(action, subject) {
    if (action.id == "org.freedesktop.systemd1.manage-units" &&
        action.lookup("unit") == "docker.service" &&
        subject.user == "testuser") {
        return polkit.Result.YES;
    }
});
EOT