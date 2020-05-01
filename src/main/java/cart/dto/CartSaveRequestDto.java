package cart.dto;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
public class CartSaveRequestDto {
    private int goods_id;
    private String email;
    private int count;
    
    @Builder
    public CartSaveRequestDto(int goods_id, String email, int count) {
    	this.goods_id = goods_id;
    	this.email  = email;
    	this.count = count;
    }
}
