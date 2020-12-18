use std::net::{TcpListener};
use std::io::{Write};

fn main() {
	let listener = TcpListener::bind("localhost:80").unwrap();
	
	println!("Hello, Docker!");
	
	for stream in listener.incoming() {
		println!("Someone connected :O");
		
		let contents = "Hello, World!";
		
		let response = format!(
			"HTTP/1.1 200 OK\r\nContent-Length: {}\r\n\r\n{}",
			contents.len(),
			contents,
		);
		
		let mut stream = stream.unwrap();
		stream.write(response.as_bytes()).unwrap();
		stream.flush().unwrap();
	}
}
