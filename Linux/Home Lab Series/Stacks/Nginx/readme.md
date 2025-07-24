# Nginx Proxy Manager Setup Guide

This guide explains how to set up Nginx Proxy Manager (NPM) with self-signed SSL certificates for local network domains.

> **Note:** Throughout this guide, replace `your.domain.local` with your desired local domain and `your-server-ip` with the actual IP address of your server.

## 1. Generate a Self-Signed SSL Certificate for Local Domains

Let's Encrypt cannot issue certificates for local-only domains (e.g., `service.lan`). You must generate a self-signed certificate instead.

### Recommended Workflow — On the Server Running NPM

1.  SSH into the server where Nginx Proxy Manager is running.

    ```bash
    ssh youruser@your-server-ip
    ```

2.  Generate the certificate and private key using OpenSSL. This example creates a certificate valid for 825 days.

    ```bash
    # Replace 'your.domain.local' with the actual domain you want to use
    openssl req -x509 -nodes -days 825 -newkey rsa:2048 \
      -keyout your.domain.local.key -out your.domain.local.crt \
      -subj "/CN=your.domain.local"
    ```

3.  Transfer the generated `your.domain.local.key` and `your.domain.local.crt` files to your local machine (e.g., via `scp`, FileZilla, or `docker cp`).

4.  Open the Nginx Proxy Manager Web UI and upload the certificate:
    *   Go to **SSL Certificates** → **Add SSL Certificate** → **Custom**.
    *   Give it a Nickname (e.g., "Local Self-Signed Cert").
    *   Upload your `your.domain.local.crt` file to the **Certificate Key** field.
    *   Upload your `your.domain.local.key` file to the **Private Key** field.
    *   Save the certificate.

5.  Apply this certificate to your Proxy Host configuration for `your.domain.local`.

## 2. Configure DNS Resolution for Local Domains

Your devices need to know that `your.domain.local` points to your server's IP address.

### Option A: Edit `hosts` file on Each Client Device

Add the following line to the `hosts` file on every device that needs to access the service.

```plaintext
# Replace with your server's IP and chosen domain
your-server-ip your.domain.local
```

**How to edit the `hosts` file:**

*   **Windows:**
    1.  Open **Notepad** as an Administrator.
    2.  Open the file: `C:\Windows\System32\drivers\etc\hosts`.
    3.  Add the line, save, and close.
    4.  Flush your DNS cache by running `ipconfig /flushdns` in Command Prompt.

*   **Linux / macOS:**
    1.  Open a terminal.
    2.  Edit the file with a text editor like `nano`:
        ```bash
        sudo nano /etc/hosts
        ```
    3.  Add the line, save, and exit.
    4.  You may need to flush the DNS cache depending on your OS version.

> **Note:** The `hosts` file only maps hostnames to IP addresses. You do **not** specify ports here.

### Option B: Use a Local DNS Server

If you run a local DNS server (like Pi-hole, AdGuard Home, or your router's DNS), add a local DNS record:

*   **Domain:** `your.domain.local`
*   **IP Address:** `your-server-ip`

All devices on your network configured to use that DNS server will resolve the domain automatically.

## 3. Import the Self-Signed Certificate to Trusted Devices

To avoid browser security warnings (`NET::ERR_CERT_AUTHORITY_INVALID`), you must import the public certificate (`.crt` file) into the trust store of your client devices.

*   **Windows:**
    1.  Run `certmgr.msc`.
    2.  Navigate to **Trusted Root Certification Authorities** → **Certificates**.
    3.  Right-click **Certificates** and select **All Tasks** → **Import...**.
    4.  Follow the wizard to import your `your.domain.local.crt` file.

*   **Linux (Debian/Ubuntu):**
    1.  Copy the certificate to the system-wide store:
        ```bash
        sudo cp your.domain.local.crt /usr/local/share/ca-certificates/
        ```
    2.  Update the certificate store:
        ```bash
        sudo update-ca-certificates
        ```

*   **macOS:**
    1.  Open the **Keychain Access** application.
    2.  Drag and drop the `your.domain.local.crt` file into the **System** keychain.
    3.  Double-click the imported certificate, expand the **Trust** section, and set "When using this certificate" to **Always Trust**.

## General Notes

*   **Security:** Always change default passwords to strong, unique passwords in a production environment.
*   **Firewall:** Ensure ports `80`, `81`, and `443` are open on your server's firewall and forwarded correctly from your router if necessary.
*   **Public Domains:** For public-facing domains, use a valid DNS provider and obtain SSL certificates via Nginx Proxy Manager’s built-in Let's Encrypt integration for proper, trusted encryption.