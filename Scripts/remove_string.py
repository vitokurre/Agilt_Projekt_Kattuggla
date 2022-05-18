def convert_into_number(total_items_before):
    split_values = total_items_before.split(":")
    number1 = int(split_values[1])
    return number1

def convert_into_number_label(labeled_items_before):
    split_values1 = labeled_items_before.split(":")
    number2 = int(split_values1[1])
    return number2

def convert_into_number_items(total_items_after):
    split_values2 = total_items_after.split(":")
    number3 = int(split_values2[1])
    return number3

def convert_into_number_labels(labeled_items_after):
    split_values3 = labeled_items_after.split(":")
    number4 = int(split_values3[1])
    return number4