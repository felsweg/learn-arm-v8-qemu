OUTPUT_FORMAT("elf32-littlearm")
OUTPUT_ARCH(arm)
TARGET(binary)

STACKTOP = 0x51000000;

SECTIONS
{
	. = 0x40010000;
	.text : { *(.text) }
	.data : { *(.data) }
	.bss : { *(.bss) }

	. = STACKTOP;
	stacktop = .;
}