#include <stdint.h>

#define PERIPHERAL_BASE (0x40000000U)
#define GPIOC_BASE (PERIPHERAL_BASE + 0x11000U)
#define RCC_BASE (PERIPHERAL_BASE + 0x21000U)

#define RCC_APB2ENR_OFFSET (0x18U)
#define RCC_APB2ENR ((volatile uint32_t*) (RCC_BASE + RCC_APB2ENR_OFFSET))
#define RCC_APB2ENR_IOPC 4

#define GPIO_CRHR_OFFSET (0x04U)
#define GPIOC_CRHR ((volatile uint32_t*) (GPIOC_BASE + GPIO_CRHR_OFFSET))
#define GPIO_MODE_13 20
#define GPIO_CNF_13 22

#define GPIO_ODR_OFFSET (0x0CU)
#define GPIOC_ODR ((volatile uint32_t*) (GPIOC_BASE + GPIO_ODR_OFFSET))

#define LED_PIN 13

void app(void)
{
        *RCC_APB2ENR |= (1 << RCC_APB2ENR_IOPC);

        *GPIOC_CRHR |= (1 << GPIO_MODE_13);
        *GPIOC_CRHR &= ~(1 << GPIO_CNF_13);
        *GPIOC_CRHR &= ~(1 << (GPIO_CNF_13 + 1));

        while(1)
        {
                *GPIOC_ODR ^= (1 << LED_PIN);
                for (uint32_t i = 0; i < 50000; i++);
        }
}
