# Q2 scenario 
# Troubleshooting Report for `internal.example.com` Connectivity Issue

## 1. **Verify DNS Resolution**

   - **What to do:**  
     First, we need to check if `internal.example.com` resolves correctly.  
     - Run this command to see if the DNS settings are correct:
       ```bash
       cat /etc/resolv.conf
       ```
     - Then, check if the domain resolves using a public DNS server like Google DNS (`8.8.8.8`):
       ```bash
       nslookup internal.example.com 8.8.8.8
       ```

   - **What you expect:**  
     The domain should resolve correctly and show the IP address of `internal.example.com`.

   - **If things go wrong:**  
     If the domain doesn't resolve, you may need to update your DNS settings in `/etc/resolv.conf`. You can add a public DNS like `8.8.8.8`.

---

## 2. **Diagnose Service Reachability**

   - **What to do:**  
     Check if the web service is actually reachable.  
     - Try using `curl` to check if the web service is online:
       ```bash
       curl -I http://internal.example.com
       curl -I https://internal.example.com
       ```
     - You can also use `telnet` to test the connection on ports 80 and 443:
       ```bash
       telnet internal.example.com 80
       telnet internal.example.com 443
       ```
     - Or check if the service is running with `ss`:
       ```bash
       ss -tuln | grep ':80\|:443'
       ```

   - **What you expect:**  
     If everything is good, you should get an HTTP response from `curl`, a successful `telnet` connection, and see that the service is listening on ports 80 or 443.

   - **If things go wrong:**  
     If the service isn't running, you may need to start it:
     ```bash
     sudo systemctl start <service-name>
     ```
     If ports are blocked, check your firewall and open the necessary ports:
     ```bash
     sudo ufw allow 80,443/tcp
     sudo ufw reload
     ```

---

## 3. **Trace the Issue – List All Possible Causes**

   - **What to check:**
     Here are some common reasons why `internal.example.com` might not be reachable:
     1. DNS resolution issues (invalid DNS settings).
     2. The web service might not be running.
     3. There could be network/firewall issues blocking ports.
     4. The web server might be misconfigured.
     
   - **Things to verify:**  
     - Check DNS settings and ensure you're using the right DNS server.
     - Verify that the web service is running and accessible.
     - Ensure that the firewall is not blocking HTTP/HTTPS traffic.

---

## 4. **Propose and Apply Fixes**

   - **If DNS is the issue:**  
     - Update your DNS settings in `/etc/resolv.conf` to use a reliable DNS server like `8.8.8.8`.  
     Example:
     ```bash
     sudo nano /etc/resolv.conf
     ```
     Add:
     ```
     nameserver 8.8.8.8
     ```

   - **If the web service is down:**  
     - Start the web service:
     ```bash
     sudo systemctl start <service-name>
     ```

   - **If the firewall is blocking traffic:**  
     - Allow ports 80 and 443 through the firewall:
     ```bash
     sudo ufw allow 80,443/tcp
     sudo ufw reload
     ```

   - **If the web server is misconfigured:**  
     - Check the web server configuration files to ensure it's listening on the correct ports.
     - Restart the web server if needed:
     ```bash
     sudo systemctl restart apache2
     ```

---

## 5. **Bonus: Local `/etc/hosts` Entry (Bypass DNS for Testing)**

   - If DNS is not working, you can bypass it temporarily by adding an entry to `/etc/hosts`:
     1. Open the hosts file:
        ```bash
        sudo nano /etc/hosts
        ```
     2. Add the IP address of `internal.example.com`:
        ```
        192.168.x.x internal.example.com
        ```
     3. Test the connection again.

---

## 6. **Persist DNS Settings Using `systemd-resolved` or `NetworkManager`**

   - **Using `systemd-resolved`:**
     ```bash
     sudo systemctl enable systemd-resolved
     sudo systemctl start systemd-resolved
     ```

   - **Using `NetworkManager`:**
     ```bash
     nmcli connection modify "System eth0" ipv4.dns "8.8.8.8"
     ```
