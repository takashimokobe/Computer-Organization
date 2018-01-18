unsigned int reverseBits(unsigned int num)
{
    unsigned int count = sizeof(num) * 8 - 1;
    unsigned int reverse_num = num;
     
    num >>= 1; 
    while(num)
    {
       reverse_num <<= 1;       
       reverse_num |= num & 1;
       num >>= 1;
       count--;
    }
    reverse_num <<= count;
    return reverse_num;
}
 
int main()
{
    unsigned int x = 1;
    printf("%u", reverseBits(x));
    getchar();
}

*/ The idea is to keep putting set bits in reverse_num until the num becomes zero. 
*/ After the num becomes zero, shift the remaining bits of reverse_num. sdfjlkasdjfkjdkjskjsd;kfajsdf


