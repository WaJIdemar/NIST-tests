from numpy.random import *


def generator(seed, n):
    r = 17 * n ** 2 + 5 * n + 3
    x = seed
    while True:
        x = (7 * r * x + r ** 2 - 11 * r) % 127
        yield x


if __name__ == "__main__":
    n = 8
    seed = 270302
    my_generator = generator(seed, n)

    file = open('mt', 'bw')

    rg = Generator(MT19937(seed))
    file.write(rg.bytes(1_000_000))

    file.close()

    file = open('mygen1', 'bw')

    count = 0
    for i in my_generator:
        file.write(i.to_bytes(1, "big"))

        count += 1
        if count == 1_000_000:
            break

