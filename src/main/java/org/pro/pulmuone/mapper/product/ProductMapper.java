package org.pro.pulmuone.mapper.product;

import java.util.List;

import org.pro.pulmuone.domain.product.ProductsDTO;

public interface ProductMapper {
  //	상품 리스트
  List<ProductsDTO> search(ProductsDTO dto);

  List<ProductsDTO> searchcount(ProductsDTO dto);

  //	추천상품 리스트
  List<ProductsDTO> best(ProductsDTO dto);

  //	상품 상세보기	
  List<ProductsDTO> view(ProductsDTO dto);

  //  상품 찜
  int wishinsert(ProductsDTO dto);
  int wishupdate(ProductsDTO dto);
  int wishdelete(ProductsDTO dto);

  //  찜 조회
  List<ProductsDTO> wishlist(ProductsDTO dto);

  //  리뷰
  List<ProductsDTO> reviewlist(ProductsDTO dto);
  List<ProductsDTO> myreviewlist(ProductsDTO dto);
  int reviewupdate(ProductsDTO dto);
  int reviewdelete(ProductsDTO dto);
  int reviewimgdelete(ProductsDTO dto);
}
