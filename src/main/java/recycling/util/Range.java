package recycling.util;

import java.util.Comparator;

import recycling.dto.buyer.MyOrder;

public class Range implements Comparator<MyOrder> {
	@Override
    public int compare(MyOrder o1, MyOrder o2) {
        // 내림차순 정렬
        return o2.getOrddtCode().compareTo(o1.getOrddtCode());
    }
}
