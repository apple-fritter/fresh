# Fresh.sh

Fresh.sh is a simple bash script that checks the age of a file URL and downloads it if it is under 24 hours old using `curl`. It also provides the option to resume interrupted downloads.

---

## Prerequisites

- Bash (version 4 or later)
- curl

---

## Usage

1. Clone the repository or download the fresh.sh script file.

2. Make the script executable:
```shell
chmod +x fresh.sh
```
3. Run the script with the file URL as an argument. Alternatively, you can run the script without providing the URL as an argument, and it will prompt you to enter the URL during execution.
```
./fresh.sh <file-url>
```

4. If the file is under 24 hours old, it will be downloaded to the current directory. If the file already exists, you will be prompted to resume the download or exit.

---

## Example
```
./fresh.sh http://example.com/file.txt
```

---

## Flowchart
```
┌─ Start Program
│
├─ Check URL
│   ├─ URL provided
│   │   ├─ Check if file exists
│   │   │   ├─ File exists
│   │   │   │   └─ Prompt to resume
│   │   │   │       ├─ Resume download
│   │   │   │       └─ Exit
│   │   │   │
│   │   │   └─ File does not exist
│   │   │
│   │   ├─ Retrieve Last-Modified header
│   │   │   ├─ Last-Modified header found
│   │   │   │   └─ Calculate file age
│   │   │   │       ├─ File is under 24 hours old
│   │   │   │       │   └─ Download file
│   │   │   │       │       └─ Download complete
│   │   │   │       │
│   │   │   │       └─ File is older than 24 hours
│   │   │   │
│   │   │   └─ Last-Modified header not found
│   │   │
│   │   └─ Skip download
│   │
│   └─ URL not provided
│
└─ End Program
```

---

## Considerations
#### Dependency on curl
The script relies on the curl command-line tool to perform the file download and retrieve the Last-Modified header. Ensure that curl is installed on the system where the script will be executed.

#### File size and download time
The script uses curl with the -C - option to resume interrupted downloads. However, keep in mind that resuming large file downloads may take a significant amount of time, especially if the interruption occurred near the beginning of the file.

#### URL validity and accessibility:
The script assumes that the provided URL is valid and accessible. Ensure that the URL points to a valid file and is accessible from the machine where the script is executed. Otherwise, the script may encounter errors or fail to download the file.

#### Last-Modified header reliability:
The script relies on the Last-Modified header to determine the age of the file. However, not all servers may provide this header, or it may not accurately reflect the last modification time of the file. The script handles cases where the Last-Modified header is not found by skipping the download.

#### Network connectivity and reliability:
The script assumes a stable network connection for downloading files. It's important to consider potential network issues or interruptions that may affect the download process. The script checks for interrupted downloads using the exit status of curl but cannot handle all possible network-related failures.

#### Security considerations:
When downloading files from external sources, it's important to ensure the security and trustworthiness of the source. Consider validating the authenticity and integrity of the file, especially if it will be used in critical or sensitive systems.

#### Script error handling:
The script performs basic error handling, such as checking if the URL is provided and exiting if it is blank. However, it may be beneficial to further enhance the error handling logic to handle various scenarios, such as network failures, permission issues, or unexpected errors.

#### Script customization:
The provided script is a basic template and can be customized to suit specific requirements. You may need to modify it based on your specific use case, such as adding additional checks, error handling, or integrating it into a larger automation workflow.

> Always thoroughly test the script and consider potential edge cases and failure scenarios specific to your environment before deploying it in a production or critical system.

---

## [Disclaimer](DISCLAIMER)
**This software is provided "as is" and without warranty of any kind**, express or implied, including but not limited to the warranties of merchantability, fitness for a particular purpose and noninfringement. In no event shall the authors or copyright holders be liable for any claim, damages or other liability, whether in an action of contract, tort or otherwise, arising from, out of or in connection with the software or the use or other dealings in the software.

**The authors do not endorse or support any harmful or malicious activities** that may be carried out with the software. It is the user's responsibility to ensure that their use of the software complies with all applicable laws and regulations.

---

## License

These files released under the [MIT License](LICENSE).
