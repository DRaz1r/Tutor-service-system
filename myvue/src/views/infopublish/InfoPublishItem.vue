<template>
    <el-row class="grid-item animate__animated animate__fadeIn">
      <el-col :span="24" class="item-content">
        <!-- 用户信息 -->
        <div class="user-info">
          <h3>{{ item.title }}</h3>
          <span class="user-name">@{{ item.userName }}</span>
        </div>
  
        <!-- 用户头像 -->
        <div class="user-avatar-container animate__animated animate__zoomIn">
          <img class="user-avatar" :src="backendUrl + item.imageUrl" alt="用户头像">
        </div>
  
        <!-- 标签栏 -->
        <div class="tags animate__animated animate__slideInUp">
          <span class="tag">{{ item.subjects }}</span>
          <span class="tag">{{ item.days }}</span>
          <span class="tag">{{ item.grades }}</span>
          <span class="tag">{{ item.periods }}</span>
          <span class="tag">
            <i class="el-icon-view"></i>
            {{ item.likes }}
          </span>          
        </div>
  
        <!-- 个人简介 -->
        <div class="introduction">
          <template v-if="showFullIntroduction">
            {{ item.introduction }}
            <el-button type="text" @click="toggleIntroduction">收起</el-button>
          </template>
          <template v-else>
            {{ item.introduction.substring(0, 30) }}<span v-if="item.introduction.length > 30">...</span>
            <el-button type="text" @click="toggleIntroduction">展开</el-button>
          </template>
        </div>
  
        <!-- 操作按钮 -->
        <div class="action-buttons">
          <el-button type="primary" icon="el-icon-thumb" @click="handleLike(item.id)">点赞</el-button>
          <el-button type="primary" icon="el-icon-chat-dot-round" @click="animateBtn">评论</el-button>
          <el-button type="primary" icon="el-icon-star-off" @click="animateBtn">收藏</el-button>
        </div>
      </el-col>
    </el-row>
  </template>
  
  <script>
  export default {
    props: {
      item: Object,
      backendUrl: String
    },
    data() {
      return {
        showFullIntroduction: false
      };
    },
    methods: {
      toggleIntroduction() {
        this.showFullIntroduction = !this.showFullIntroduction;
      },
      handleLike(itemId) {
        // 触发一个名为 like 的自定义事件，并将 itemId 作为事件的参数传递出去。
        // 在父组件中，可以通过监听这个自定义事件来处理点赞逻辑
        this.$emit('like', itemId);
      },
      animateBtn(event) {
        const button = event.currentTarget;
        button.classList.add('animate__animated', 'animate__bounce');
        button.addEventListener('animationend', () => {
          button.classList.remove('animate__animated', 'animate__bounce');
        }, { once: true });
      }
    }
  };
  </script>
  
  <style scoped>
  .item-content {
    padding: 20px;
  }
  
  .user-info {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 10px;
  }
  
  .user-name {
    color: #888;
    font-size: 14px;
  }
  
  .user-avatar-container {
    text-align: center;
    margin-bottom: 10px;
  }
  
  .user-avatar {
    width: 95%;
    border-radius: 10%;
    object-fit: cover;
    border: 2px solid #eaeaea;
  }
  
  .tags {
    display: flex;
    flex-wrap: wrap;
    gap: 8px;
    margin-bottom: 10px;
  }
  
  .tag {
    background-color: #f5f5f5;
    border-radius: 12px;
    padding: 6px 12px;
    font-size: 12px;
    color: #666;
  }
  
  .introduction {
    margin-bottom: 10px;
    font-size: 14px;
  }
  
  .action-buttons {
    display: flex;
    justify-content: flex-end; /* 将按钮靠右对齐 */
    margin-top: 10px;
  }
  </style>
  