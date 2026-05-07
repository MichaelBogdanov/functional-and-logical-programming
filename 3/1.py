def sejdvik_sequence(gaps, d, i, n):
    if d > n:
        return gaps
    news_gaps = gaps + [d]
    if i % 2 == 0:
        new_d = 9 * 2 ** i - 9 * 2 ** (i / 2) + 1
    else:
        new_d = 8 * 2 ** i - 6 * 2 ** ((i + 1) / 2) + 1
    return sejdvik_sequence(news_gaps, int(new_d), i + 1, n)


def insertion_sort(data: list[int], gap: int) -> list[int]:
    def insert(sorted_part: list[int], value: int) -> list[int]:
        if not sorted_part or sorted_part[-1] <= value:
            return sorted_part + [value]
        else:
            return insert(sorted_part[:-1], value) + [sorted_part[-1]]

    def sort_with_gap(unsorted: list[int]) -> list[int]:
        if not unsorted:
            return []
        first, *rest = unsorted
        sorted_rest = sort_with_gap(rest)
        return insert(sorted_rest[:gap], first) + sorted_rest[gap:]

    return sort_with_gap(data)

def shell_sort(data: list[int], gaps: list[int]) -> list[int]:
    def sort_with_all_gaps(data: list[int], gaps: list[int]) -> list[int]:
        if not gaps:
            return data
        else:
            current_gap = gaps[0]
            sorted_data = insertion_sort(data, current_gap)
            return sort_with_all_gaps(sorted_data, gaps[1:])

    return sort_with_all_gaps(data, gaps)


a = [9, 1, 5, 3, 7]
gaps = sejdvik_sequence([], 1, 1, len(a))
print(shell_sort(a, gaps))