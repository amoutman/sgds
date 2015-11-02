package com.creditease.sgds.user.dao;

import java.math.BigDecimal;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.creditease.sgds.user.model.UserCoupon;

public interface UserCouponMapper {
    int deleteByPrimaryKey(String id);

    int insert(UserCoupon record);

    int insertSelective(UserCoupon record);

    UserCoupon selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(UserCoupon record);

    int updateByPrimaryKey(UserCoupon record);
    
    List<UserCoupon> selectCouponsByUserId(@Param("userId")String userId, @Param("status")Integer status, @Param("orderAmount")BigDecimal orderAmount);
}