void main() {
    char *video_memory = (char *) 0xB8000;
    video_memory[0] = 'K';
    video_memory[1] = 0x07;
}
