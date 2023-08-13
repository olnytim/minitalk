# :rocket: Minitalk Project :rocket:

## :scroll: Description

This project is part of the curriculum at 42 School and involves creating a small client-server application for communication using only signals. The main goal is to implement a simple communication protocol between a client and a server to transmit messages.

## :bookmark_tabs: Table of Contents

- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## :computer: Getting Started

### :clipboard: Prerequisites

Before you begin, ensure you have met the following requirements:

- You have a basic understanding of C programming.
- You have access to a Unix-like operating system (Linux or macOS).

### :wrench: Installation

1. Clone the repository:

```sh
git clone https://github.com/olnytim/minitalk.git
cd minitalk
```

2. Build the server and client binaries:

```sh
make
```

## :bulb: Usage

1. Start the server:

```sh
./server
```

2. Run the client, providing the server's process ID (PID) and the message you want to send:

```sh
./client <server-pid> "Hello, Minitalk!"
```

3. The server will receive the message and display it.



## :warning: ATTENTION!!!!! :warning:

## :hammer_and_wrench: Challenges and Solutions

During the development of this project, we encountered a specific issue on macOS systems related to signals. The problem occurred when the kernel sent a signal with a value of 0, causing the encoding process to crash. To address this issue, we implemented a workaround by ensuring that the signal value is not allowed to be 0.

## :raised_hands: Contributing

Contributions are welcome! If you'd like to contribute to this project, please follow these steps:

1. Fork the project.
2. Create a new branch.
3. Make your changes and commit them.
4. Push to your forked repository.
5. Submit a pull request.
