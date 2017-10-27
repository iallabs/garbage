factorial = lambda x: 1 if x == 1 else x * factorial(x-1)


class sample(object):
    # PE 74
    limit = 1000000
    def __init__(self):
        self.longest_chain = None
        self.number_lc = None
        self.seen_numbers = []
        self.iter_list = range(10, self.limit)
    @staticmethod
    def sum_fact_digits(n):
        return sum([factorial(int(i)) if i != '0' else 1 for i in str(n)])
    def expand_chain(self, n):
        _sum = self.sum_fact_digits(n)
        __seen_numbers = [n]
        chain_long = 0
        while not _sum in __seen_numbers:
            __seen_numbers += [_sum]
            _sum = self.sum_fact_digits(_sum)
            chain_long += 1
        return chain_long + 1, __seen_numbers
