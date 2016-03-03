# YLGoodsAutoDiscountSystem#
##设计结构##
- 分成三个部分：
- 1.数据生成，由界面输入数据，模拟前台扫描，后处理成需要的json数据；
- 2.设置优惠，模拟后台操作，设置相应产品的优惠，并形成本地数据库（包含所有商品的基本信息，是否参与优惠）；
- 3.生成小票模块，取的输入json数据，结合本地数据（数据库）信息生成卖出商品的model，然后进行处理，生成所需小票信息；
##关于优惠##
- 可能后续有不同的优惠，所以采用协议，这样新的优惠只需遵守协议即可重写实现；
- 测试可以在终端和模拟器上看到；
##关于自己##
&emsp;&emsp;我才做iOS一年左右，而且是从其他行业里面转行过来的，但我超级喜欢编程，每分每秒都在努力的成长；而且我超喜欢你们公司，谢谢你们，给我这次机会。Thank you！
