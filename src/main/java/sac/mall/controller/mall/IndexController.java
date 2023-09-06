package sac.mall.controller.mall;

import org.springframework.stereotype.Controller;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.GetMapping;
import sac.mall.common.Constants;
import sac.mall.controller.vo.IndexCarouselVO;
import sac.mall.controller.vo.IndexCategoryVO;
import sac.mall.entity.Goods;
import sac.mall.service.CarouselService;
import sac.mall.service.CategoryService;
import sac.mall.service.GoodsService;
import sac.mall.service.IndexConfigService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class IndexController {

    @Resource
    private CarouselService carouselService;

    @Resource
    private IndexConfigService indexConfigService;

    @Resource
    private CategoryService categoryService;
    @Resource
    private GoodsService goodsService;

    @GetMapping({"/index", "/", "/index.html"})
    public String indexPage(HttpServletRequest request) {
        List<IndexCategoryVO> categories = categoryService.getCategoriesForIndex();
        if (CollectionUtils.isEmpty(categories)) {
            return "error/error_5xx";
        }
        List<IndexCarouselVO> carousels = carouselService.getCarouselsForIndex(Constants.INDEX_CAROUSEL_NUMBER);
        List<Goods> goodsList = goodsService.selectGoodsList();
        request.setAttribute("categories", categories);//分类数据
        request.setAttribute("carousels", carousels);//轮播图
        request.setAttribute("goodsList", goodsList);  //新品上市
        return "mall/index";
    }
}
