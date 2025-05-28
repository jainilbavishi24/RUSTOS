#![no_std]
#![no_main]
#![feature(panic_info_message)]

use core::panic::PanicInfo;

mod vga_buffer;

#[unsafe(no_mangle)]

pub extern "C" fn _start() -> ! {
    println!("Hello World{}", "!");
    
    // Test panic handling
    
    
    panic!("Test panic message yu hu!");
    
    loop {}
}

#[panic_handler]
fn panic(info: &PanicInfo) -> ! {
    println!("{}", info);
    loop {}
}