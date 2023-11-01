package com.example.onlinequiz.Payload.Response;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ArticleLessonResponse {
    private Long lessonId;
    private String lessonName;
    private Integer lessonOrder;
    private String lessonArticle;
}
