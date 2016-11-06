def max_subarray(xs):
    max_ending_here = max_so_far = 0
    for x in xs:
        max_ending_here = max(0, max_ending_here + x)
        max_so_far = max(max_so_far, max_ending_here)
    return max_so_far

print(max_subarray([-1, -2, 3, 1, -1, -2, 3, 2, -4]))