include hardware/qcom-caf/common/qcom_defs.mk

ifneq ($(filter $(UM_4_9_FAMILY) $(UM_4_14_FAMILY) $(UM_4_19_FAMILY) $(UM_5_4_FAMILY),$(TARGET_BOARD_PLATFORM)),)
    include device/qcom/sepolicy_vndr/legacy-um/SEPolicy.mk
else ifneq ($(filter $(UM_5_10_FAMILY),$(TARGET_BOARD_PLATFORM)),)
    include device/qcom/sepolicy_vndr/sm8450/SEPolicy.mk
else ifneq ($(filter $(UM_5_15_FAMILY),$(TARGET_BOARD_PLATFORM)),)
    include device/qcom/sepolicy_vndr/sm8550/SEPolicy.mk
else ifneq ($(filter $(UM_6_1_FAMILY),$(TARGET_BOARD_PLATFORM)),)
    include device/qcom/sepolicy_vndr/sm8650/SEPolicy.mk
else ifneq ($(filter $(UM_6_6_FAMILY),$(TARGET_BOARD_PLATFORM)),)
    include device/qcom/sepolicy_vndr/sm8750/SEPolicy.mk
else ifneq ($(filter $(UM_6_12_FAMILY),$(TARGET_BOARD_PLATFORM)),)
    include device/qcom/sepolicy_vndr/sm8850/SEPolicy.mk
endif

# Abyss: 原来这里 -include device/lineage/sepolicy/qcom/sepolicy.mk。
# 那份策略里的 lineage 内容（hal_lineage_* / lineage_*_service / ro.lineage.*）在本 ROM 里没有对应用户，
# 已复制一份去掉这些内容到 hardware/oplus/sepolicy/qcom，类型定义与 m4 映射保持不变。
include hardware/oplus/sepolicy/qcom/sepolicy.mk
