
## Winfection - Software Diagnostic & Infection Prevention Tool

This project provides a set of batch and VBScript files designed to **diagnose, monitor, and block potentially harmful activity on your Windows system, with a focus on startup automation vulnerabilities.** The scripts perform proactive checks and help users prevent unwanted or malicious files from establishing persistence on your PC.

### Contents

- **init.bat**: Main diagnostic script. Scans all drives for suspicious files and known malware indicators, copies findings to a secure quarantine directory for review, and configures diagnostic routines to run at every startup for ongoing protection.
- **setup-1234.bat**: Performs extended directory scans, actively looking for executable files (*.exe*) that may pose a threat. Executes additional diagnostic routines in a loop for thorough inspection.
- **cmd-5678.bat**: Runs periodic system checks via PowerShell in a controlled loop, monitoring for unexpected system state changes.
- **start.vbs**: Orchestrates scheduled diagnostics and ensures all scripts run together for comprehensive protection at system startup.

### Usage Instructions

1. **Extract all files** into any folder on the target Windows machine.
2. **Run `init.bat` as Administrator:**
   - Right-click on `init.bat` and select **Run as administrator**.
   - **Administrator rights are required** for deep scanning and the ability to block malware persistence vectors.
3. The tool will:
   - Scan all drives for suspicious files and known threats.
   - Quarantine any findings in a designated safe directory.
   - Add `start.vbs` to your Startup folder so that automated diagnostic checks occur with every login.
   - Immediately run `start.vbs` to launch initial protection and monitoring.

### Notes

- **Administrative privileges are required** for full scan and prevention features.
- Please review the diagnosis scripts before use to understand scan behavior and ensure compliance with your organization’s security policies.
- To **disable ongoing monitoring**, remove `start.vbs` from your user’s Startup folder.
- This tool does not modify or remove system files automatically; all findings are quarantined for manual review to ensure no legitimate files are affected.

***

**This tool is developed for IT professionals and power users seeking to increase their system’s resilience against malware and persistent startup threats.** Always practice safe computing and review all scripts before running on production systems.
